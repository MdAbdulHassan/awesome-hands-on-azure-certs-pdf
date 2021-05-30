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

Other Useful Resources :
<br>
[Top 10 Azure resources that you can use today](https://microsoft.github.io/AzureTipsAndTricks/blog/tip276.html)
 <br>
[Download all Azure Documentation for offline viewing](https://microsoft.github.io/AzureTipsAndTricks/blog/tip128.html)
 <br>
[Azure Tips and Tricks, is a special collection hundreds of tips in form of blog posts and videos](https://aka.ms/azuretipsandtricks)
 <br>
[@Azure-Samples, Microsoft Azure code samples and examples in .NET, Java, Python, Node.js, PHP and Ruby](https://github.com/Azure-Samples)
 <br>
[Azure Resources - Useful Links](https://github.com/gsuttie/AzureResources/tree/master/Useful%20Links)
