# Awesome Hands-on Azure Certifications in PDF
A curated list of Practical labs of Microsoft Certifications by MicrosoftLearning in .pdf format

## Direct Download Hands-on PDF file for particular exam by its Repository Name at [@MicrosoftLearning](https://github.com/MicrosoftLearning)
This repository has filenames of [Repository].pdf
<br />
https://github.com/MicrosoftLearning/[Repository] -> https://github.com/MdAbdulHassan/awesome-hands-on-azure-certs-pdf/raw/main/[Repository].pdf

For example, to download pdf of DP-203 certification
* Official Repository : https://github.com/MicrosoftLearning/DP-203T00-Data-Engineering-on-Microsoft-Azure
* Direct url of the PDF : https://raw.githubusercontent.com/MdAbdulHassan/awesome-hands-on-azure-certs-pdf/main/DP-203T00-Data-Engineering-on-Microsoft-Azure.pdf

```bash
repositoryName="DP-203T00-Data-Engineering-on-Microsoft-Azure" # Official Repository Name
echo -e 'Downloading the snapshot PDF derived from the repository https://github.com/MicrosoftLearning/"${repositoryName}" '
curl -sOL https://raw.githubusercontent.com/MdAbdulHassan/awesome-hands-on-azure-certs-pdf/main/"${repositoryName}".pdf
```

## Create the latest PDFs from official [@MicrosoftLearning](https://github.com/MicrosoftLearning) Repositories

The following script downloads the latest repositories of [@MicrosoftLearning](https://github.com/MicrosoftLearning), then merges and converts markdown files of all Modules to PDF.

```bash
curl -sOL https://raw.githubusercontent.com/MdAbdulHassan/awesome-hands-on-azure-certs-pdf/main/scripts-for-creating-latest-pdfs/clone_MicrosoftLearning_certs_en_repositories.sh
curl -sOL https://raw.githubusercontent.com/MdAbdulHassan/awesome-hands-on-azure-certs-pdf/main/scripts-for-creating-latest-pdfs/merge_and_convert_md_files_recursively_to_pdf.sh
bash clone_MicrosoftLearning_certs_en_repositories.sh
bash merge_and_convert_md_files_recursively_to_pdf.sh
```
