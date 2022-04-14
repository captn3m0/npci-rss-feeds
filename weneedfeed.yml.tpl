&SELECTOR:
  item_selector: '#year__YEAR__ .pdf-item'
  item_description_selector: p
  item_link_selector: a:nth-child(1)
  item_title_selector: p:nth-child(2)
pages:
  - <<: *SELECTOR
    id: upi
    title: UPI Circulars
    description: NPCI UPI Circulars
    url: "https://www.npci.org.in/what-we-do/upi/circular"
  - <<: *SELECTOR
    id: cts
    title: CTS Circulars
    description: NPCI CTS Circulars
    url: "https://www.npci.org.in/what-we-do/cts/circulars"
  - <<: *SELECTOR
    id: rupay
    title: RuPay Circulars
    description: NPCI RuPay Circulars
    url: "https://npci.org.in/what-we-do/rupay/circulars"
  - <<: *SELECTOR
    id: nach
    title: NACH Circulars
    description: NPCI NACH Circulars
    url: "https://npci.org.in/what-we-do/nach/circulars"
  - <<: *SELECTOR
    id: imps
    title: IMPS Circulars
    description: NPCI IMPS Circulars
    url: "https://npci.org.in/what-we-do/imps/circular"
  - <<: *SELECTOR
    id: netc
    title: NETC FASTag Circulars
    description: NPCI FASTag Circulars
    url: "https://npci.org.in/what-we-do/netc-fastag/circulars"
  - <<: *SELECTOR
    id: "99"
    title: "*99# Circulars"
    description: "NPCI *99# Circulars"
    url: "https://npci.org.in/what-we-do/99/circular"
  - <<: *SELECTOR
    id: nfs
    title: NFS Circulars
    description: "NPCI NFS Circulars"
    url: "https://npci.org.in/what-we-do/nfs/circulars"
  - <<: *SELECTOR
    id: aeps
    title: AePS Circulars
    description: "NPCI AePS Circulars"
    url: "https://npci.org.in/what-we-do/aeps/circulars"
  - <<: *SELECTOR
    id: bhim-aadhaar
    title: BHIM Aadhaar Circulars"
    description: "NPCI BHIM Aadhaar Circulars"
    url: "https://npci.org.in/what-we-do/bhim-aadhaar/circular"
  - <<: *SELECTOR
    id: e-rupi
    title: e-RUPI Circulars"
    description: "NPCI e-RUPI Circulars"
    url: "https://npci.org.in/what-we-do/e-rupi/circular"
  - <<: *SELECTOR
    id: bbps
    title: Bharat BillPay Circulars"
    description: "NPCI Bharat BillPay (BBPS) Circulars"
    url: "https://npci.org.in/what-we-do/bharat-billpay/circulars"