User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36
.common_selectors: &selector
  item_selector: '#year__YEAR__ .pdf-item'
  item_description_selector: p
  item_link_selector: a:nth-child(1)
  item_title_selector: p:nth-child(2)
pages:
  - <<: *selector
    id: upi
    title: UPI Circulars
    description: NPCI UPI Circulars
    url: "https://www.npci.org.in/what-we-do/upi/circular"
  - <<: *selector
    id: cts
    title: CTS Circulars
    description: NPCI CTS Circulars
    url: "https://www.npci.org.in/what-we-do/cts/circulars"
  - <<: *selector
    id: rupay
    title: RuPay Circulars
    description: NPCI RuPay Circulars
    url: "https://www.npci.org.in/what-we-do/rupay/circulars"
  - <<: *selector
    id: nach
    title: NACH Circulars
    description: NPCI NACH Circulars
    url: "https://www.npci.org.in/what-we-do/nach/circulars"
  - <<: *selector
    id: imps
    title: IMPS Circulars
    description: NPCI IMPS Circulars
    url: "https://www.npci.org.in/what-we-do/imps/circular"
  - <<: *selector
    id: netc
    title: NETC FASTag Circulars
    description: NPCI FASTag Circulars
    url: "https://www.npci.org.in/what-we-do/netc-fastag/circulars"
  - <<: *selector
    id: "99"
    title: "*99# Circulars"
    description: "NPCI *99# Circulars"
    url: "https://www.npci.org.in/what-we-do/99/circular"
  - <<: *selector
    id: nfs
    title: NFS Circulars
    description: "NPCI NFS Circulars"
    url: "https://www.npci.org.in/what-we-do/nfs/circulars"
  - <<: *selector
    id: aeps
    title: AePS Circulars
    description: "NPCI AePS Circulars"
    url: "https://www.npci.org.in/what-we-do/aeps/circulars"
  # - <<: *selector
  #   id: bhim-aadhaar
  #   title: BHIM Aadhaar Circulars
  #   description: "NPCI BHIM Aadhaar Circulars"
  #   url: "https://www.npci.org.in/what-we-do/bhim-aadhaar/circular"
  - <<: *selector
    id: e-rupi
    title: e-RUPI Circulars
    description: "NPCI e-RUPI Circulars"
    url: "https://www.npci.org.in/what-we-do/e-rupi/circular"
  - <<: *selector
    id: bbps
    title: Bharat BillPay Circulars
    description: "NPCI Bharat BillPay (BBPS) Circulars"
    url: "https://www.npci.org.in/what-we-do/bharat-billpay/circulars"