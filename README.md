# Introduction

This project provides an example and instructions for deploying Ellucian platform artifacts through the Ellucian Deployment Engine (EDE).  Included are example scripts which demonstrate calling the Manifest Deployment API (MDAPI).

# Prerequisites

* Your Ethos Integration tenant must contain a Platform Component record labeled with "Ethos Deployment Engine".  This is provisioned by Ellucian automatically.

* Your Ethos Integration tenant must contain an application which can be used to call the MDAPI endpoints.  An application labeled "Deployment Engine" is provisioned by Ellucian automatically for this purpose, but you can create a different one if desired.
    * If a new application is created, add it to the **Application Access** list on Ethos Deployment Engine platform component.
    * If a new application is created, add it to the **Application Access** list on the Experience platform component.  This enables the next step of using it in Permissions.
    * In Experience Setup -> Permissions -> Deployment Engine, grant the **Upload and Execute** permission to the Ethos application that will be used for calling MDAPI endpoints.
    * You will use the API key from this Ethos Integration application to obtain a token for calling MDAPI endpoints.
    * Refer to the next section for an important step of restricting the Ethos API key.


# Restricting the MDAPI Ethos API Key

Being able to provision resources into an environment using EDE is a privileged operation.  As an extra precaution, the Ethos API key that provides access to EDE should have the proper IP address restrictions associated to it.  Ellucian automatically provisions the "Deployment Engine" application with a CIDR block that prevents access from any IP address.  Be sure to update this to an appropriate CIDR block, or remove the restrictions at your own risk.  If the "Deployment Engine" application does not have any IP restrictions, consider adding a CIDR block to it.


# What is the example?

This project contains the simplest possible `manifest.json`, which creates a single resource - an Ethos application.  Many integration projects require an Ethos app, so this is a good basic example to start with.  The Ethos app created by this manifest is completely unrelated to the Ethos app being used to call the MDAPI.

The `manifest-schema.json` file contains the full set of potential resources that can be specified and deployed through EDE.

# Deploying the Example

The directory structure containing the example is located in `mdapi-test-solution`.  A bash script is included (`zip.sh`) to zip the directory into the structure that EDE expects:

```
    solutions/
    solutions/mdapi-test-solution/
    solutions/mdapi-test-solution/manifest.json
    solutions/mdapi-test-solution/manifest-schema.json
```

You must create the zip file first by executing this script.

There are also two cURL scripts included, but these can be mimicked in Bruno, Postman, etc.

* `deploy.sh` - Submit a zip file for deployment
* `get-status.sh` - Check the status of the deployment

To deploy the example:

```
export apiKey="your-api-key-here"
./deploy.sh
```

This will print a deployment ID in the response.


To check the status of your deployment:
```
export deployId="your-deploy-id-here"
./get-status.sh
```