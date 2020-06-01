# cfbpR
The Consumer Financial Protection Bureau (CFPB) regulates the offering and provision of consumer financial products or services under the federal consumer financial laws and educates and empowers consumers to make better informed financial decisions.
___

## Installation and Setup
Install the latest version from github as follows.

```
devtools::install_github('JoseAndresMontes/cfpbR')
```

The API is open data that requires no credentials to access. This API client has set up supported parameters to output an R friendly version of the available data.
Click [here](https://cfpb.github.io/api/ccdb/api.html) to learn more about the API.
 
## Basic Usage
cfpbR provides easy to use function for the API service, with API parameters as function arguments. GetConsumerComplaints function gathers all available complaint data.

For example:

```
data <- GetConsumerComplaints()
```
