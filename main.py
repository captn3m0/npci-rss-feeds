import os
import yaml
import curl_cffi
from bs4 import BeautifulSoup
from feedgen.feed import FeedGenerator
from datetime import datetime, timezone
from urllib.parse import urljoin, urlparse

BROWSER_CODE = "safari18_4_ios"


def load_config():
    """Load and parse the weneedfeed.yml configuration file."""
    with open('config.yml', 'r') as f:
        return yaml.safe_load(f)


def create_output_dirs():
    """Create output directories if they don't exist."""
    os.makedirs('output/feeds', exist_ok=True)


def scrape_page(page_config):
    """Scrape a single page and extract feed items."""
    try:
        body = curl_cffi.get(page_config['url'], impersonate=BROWSER_CODE).content
        
        soup = BeautifulSoup(body, 'html.parser')
        items = []
        
        # Find all items using the configured selector
        item_elements = soup.select(page_config['item_selector'])
        
        for item_element in item_elements:
            try:
                # Extract title
                title_element = item_element.select_one(page_config['item_title_selector'])
                title = title_element.get_text().strip() if title_element else "No title"
                
                # Extract description
                desc_element = item_element.select_one(page_config['item_description_selector'])
                description = desc_element.get_text().strip() if desc_element else "No description"
                
                # Extract link
                link_element = item_element.select_one(page_config['item_link_selector'])
                if link_element:
                    link = link_element.get('href', '')
                    # Convert relative URLs to absolute URLs
                    if link and not link.startswith('http'):
                        base_url = f"{urlparse(page_config['url']).scheme}://{urlparse(page_config['url']).netloc}"
                        link = urljoin(base_url, link)
                else:
                    link = page_config['url']
                
                if title and title != "No title":
                    items.append({
                        'title': title,
                        'description': description,
                        'link': link
                    })
                    
            except Exception as e:
                print(f"Error processing item in {page_config['id']}: {e}")
                continue
                
        # Limit to 25 items
        return items[:25]
        
    except Exception as e:
        print(f"Error scraping {page_config['url']}: {e}")
        return []


def generate_atom_feed(page_config, items, base_url):
    """Generate an Atom XML feed for a page."""
    fg = FeedGenerator()
    
    # Set feed metadata
    feed_url = f"{base_url}feeds/{page_config['id']}.xml"
    fg.id(feed_url)
    fg.title(page_config['title'])
    fg.description(page_config['description'])
    fg.link(href=page_config['url'], rel='alternate')
    fg.link(href=feed_url, rel='self')
    fg.language('en')
    fg.updated(datetime.now(timezone.utc))
    
    # Add items to feed
    for item in items:
        fe = fg.add_entry()
        fe.id(item['link'])
        fe.title(item['title'])
        fe.description(item['description'])
        fe.link(href=item['link'])
        fe.updated(datetime.now(timezone.utc))
    
    # Write the feed to file
    feed_path = f"output/feeds/{page_config['id']}.xml"
    fg.atom_file(feed_path, pretty=True)
    print(f"Generated feed: {feed_path}")


def generate_index_html(config):
    """Generate the index.html file."""
    base_url = config.get('base-url', '/')
    
    html_content = '''<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>Weneedfeed</title>
  </head>
  <body>
    <section>
      <header>
        <h1>Feeds</h1>
      </header>
      <ul>
        '''
    
    # Sort pages by title for consistent output
    sorted_pages = sorted(config['pages'], key=lambda x: x['title'])
    
    for page in sorted_pages:
        feed_url = f"{base_url}feeds/{page['id']}.xml"
        html_content += f'''        
        <li>
          <a href="{feed_url}">{page['title']}</a>
        </li>
        '''
    
    html_content += '''        
      </ul>
    </section>
    <section>
      <header>
        <h1>Others</h1>
      </header>
      <ul>
        <li><a href="''' + base_url + '''opml.xml">OPML</a></li>
      </ul>
    </section>
  </body>
</html>
'''
    
    with open('output/index.html', 'w') as f:
        f.write(html_content)
    print("Generated output/index.html")


def main():
    """Main function to orchestrate the feed generation process."""
    print("Starting NPCI RSS feeds generation...")
    
    # Load configuration
    config = load_config()
    base_url = config.get('base-url', '/')
    
    # Create output directories
    create_output_dirs()
    
    # Process each page
    for page in config['pages']:
        print(f"Processing {page['title']}...")
        
        # Scrape the page
        items = scrape_page(page)
        print(f"Found {len(items)} items for {page['title']}")
        
        # Generate Atom feed
        generate_atom_feed(page, items, base_url)
    
    # Generate index.html
    generate_index_html(config)
    
    print("Feed generation completed!")


if __name__ == "__main__":
    main()
