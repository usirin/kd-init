module.exports = providers =
  aws                      :
    name                   : 'Amazon Web Services'
    link                   : 'https://aws.amazon.com'
    title                  : 'AWS Credential'
    supported              : yes
    enabled                : yes
    color                  : '#F9A900'
    description            : 'Amazon Web Services'
    instanceTypes          : require './instance-types/aws'
    defaultTemplate        : require './templates/aws'
    advancedFields         : [
                              'subnet', 'sg', 'vpc',
                              'ami', 'acl', 'cidr_block',
                              'igw', 'rtb'
                             ]
    attributeMapping       :
      image                : 'ami'
      instance_type        : 'instance_type'
      storage_size         : 'storage'
    credentialFields       :
      access_key           :
        label              : 'Access Key ID'
        placeholder        : 'aws access key'
      secret_key           :
        label              : 'Secret Access Key'
        placeholder        : 'aws secret key'
      region               :
        label              : 'Region'
        type               : 'selection'
        placeholder        : 'Region'
        defaultValue       : 'us-east-1'
        values             : [
          { title: 'US East (N. Virginia) (us-east-1)',         value: 'us-east-1' }
          { title: 'US West (Oregon) (us-west-2)',              value: 'us-west-2' }
          { title: 'US West (N. California) (us-west-1)',       value: 'us-west-1' }
          { title: 'EU (Ireland) (eu-west-1)',                  value: 'eu-west-1' }
          { title: 'EU (Frankfurt) (eu-central-1)',             value: 'eu-central-1' }
          { title: 'Asia Pacific (Singapore) (ap-southeast-1)', value: 'ap-southeast-1' }
          { title: 'Asia Pacific (Sydney) (ap-southeast-2)',    value: 'ap-southeast-2' }
          { title: 'Asia Pacific (Tokyo) (ap-northeast-1)',     value: 'ap-northeast-1' }
          { title: 'South America (Sao Paulo) (sa-east-1)',     value: 'sa-east-1' }
        ]

  vagrant                  :
    name                   : 'Vagrant'
    link                   : 'http://www.vagrantup.com'
    title                  : 'KD Host Query ID'
    color                  : '#B52025'
    supported              : yes
    enabled                : 'beta'
    defaultTemplate        : require './templates/vagrant'
    description            : 'Local provisioning with Vagrant'
    credentialFields       :
      queryString          :
        label              : 'Kite ID'
        placeholder        : 'ID for my local machine kite'

  koding                   :
    name                   : 'Koding'
    link                   : 'https://koding.com'
    title                  : 'Koding'
    color                  : '#50c157'
    description            : 'Koding rulez.'
    credentialFields       : {}

  google                   :
    name                   : 'Google Compute Engine'
    link                   : 'https://cloud.google.com/compute/'
    title                  : 'Google Cloud Credential'
    color                  : '#357e99' # dunno
    supported              : yes
    enabled                : 'beta'
    defaultTemplate        : require './templates/google'
    description            : 'Google compute engine'
    instanceTypes          : require './instance-types/gce'
    advancedFields         : []
    attributeMapping       :
      image                : 'disk.0.image' # getting the first disk image ~ GG
      instance_type        : 'machine_type'
      region               : 'zone'
    credentialFields       :
      project              :
        label              : 'Project ID'
        placeholder        : 'ID of Project'
      credentials          :
        label              : 'Service account JSON key'
        placeholder        : 'Provide content of key in JSON format'
        type               : 'textarea'
      region               :
        label              : 'Region'
        type               : 'selection'
        placeholder        : '' # dunno
        defaultValue       : 'us-central1'
        values             : [
          { title: 'Western US (us-west1)',         value: 'us-west1' }
          { title: 'Central US (us-central1)',      value: 'us-central1' }
          { title: 'Eastern US (us-east1)',         value: 'us-east1' }
          { title: 'Western Europe (europe-west1)', value: 'europe-west1' }
          { title: 'Eastern Asia (asia-east1)',     value: 'asia-east1' }
        ]

  digitalocean             :
    name                   : 'Digital Ocean'
    link                   : 'https://digitalocean.com'
    title                  : 'Digital Ocean Credential'
    color                  : '#7abad7'
    supported              : yes
    slug                   : 'do'
    enabled                : 'beta'
    defaultTemplate        : require './templates/digitalocean'
    instanceTypes          : require './instance-types/do'
    description            : 'Digital Ocean droplets'
    attributeMapping       :
      image                : 'image'
      instance_type        : 'size'
      region               : 'region'
    credentialFields       :
      access_token         :
        label              : 'Access Token'
        placeholder        : 'Digital Ocean access token'

  azure                    :
    name                   : 'Azure'
    link                   : 'https://azure.microsoft.com/'
    title                  : 'Azure Credential'
    color                  : '#ec06be'
    supported              : yes
    enabled                : 'beta'
    defaultTemplate        : require './templates/azure'
    description            : 'Azure'
    instanceTypes          : require './instance-types/azure'
    advancedFields         : ['password', 'ssh_key_thumbprint']
    attributeMapping       :
      image                : 'image'
      instance_type        : 'size'
      region               : 'location'
    credentialFields       :
      publish_settings     :
        label              : 'Publish Settings'
        placeholder        : 'publish settings for azure'
        type               : 'textarea'
      subscription_id      :
        label              : 'Subscription ID'
        placeholder        : 'subscription id of azure account'
      password             :
        label              : 'Password'
        placeholder        : 'default password for instances'
        type               : 'password'
      ssh_key_thumbprint   :
        label              : 'SSH Key'
        placeholder        : 'ssh key thumb print'
      location             :
        label              : 'Location'
        type               : 'selection'
        placeholder        : 'location / region'
        defaultValue       : 'East US 2'
        values             : [
          { title: 'West US 2 (west-us-2)',             value: 'West US 2' }
          { title: 'West Central US (west-central-us)', value: 'West Central US' }
          { title: 'Quebec City (canada-east)',         value: 'Canada East' }
          { title: 'Sao Paulo State (brazil-south)',    value: 'Brazil South' }
          { title: 'Tokyo, Saitama (japan-east)',       value: 'Japan East' }
          { title: 'Virginia (east-us)',                value: 'East US' }
          { title: 'Virginia (east-us-2)',              value: 'East US 2' }
          { title: 'Iowa (central-us)',                 value: 'Central US' }
          { title: 'Illinois (north-central-us)',       value: 'North Central US' }
          { title: 'Texas (south-central-us)',          value: 'South Central US' }
          { title: 'California (west-us)',              value: 'West US' }
          { title: 'Virginia (us-gov-virginia)',        value: 'US Gov Virginia' }
          { title: 'Iowa (us-gov-iowa)',                value: 'US Gov Iowa' }
          { title: 'Toronto (canada-central)',          value: 'Canada Central' }
          { title: 'Arizona (us-gov-arizona)',          value: 'US Gov Arizona' }
          { title: 'Texas (us-gov-texas)',              value: 'US Gov Texas' }
          { title: 'Ireland (north-europe)',            value: 'North Europe' }
          { title: 'Netherlands (west-europe)',         value: 'West Europe' }
          { title: 'Frankfurt (germany-central)',       value: 'Germany Central' }
          { title: 'Magdeburg (germany-northeast)',     value: 'Germany Northeast' }
          { title: 'Cardiff (uk-west)',                 value: 'UK West' }
          { title: 'London (uk-south-)',                value: 'UK South ' }
          { title: 'Singapore (southeast-asia)',        value: 'Southeast Asia' }
          { title: 'Kong (east-asia-hong)',             value: 'East Asia Hong' }
          { title: 'New South, Wales (australia-east)', value: 'Australia East' }
          { title: 'Victoria (australia-southeast)',    value: 'Australia Southeast' }
          { title: 'Pune (central-india)',              value: 'Central India' }
          { title: 'Mumbai (west-india)',               value: 'West India' }
          { title: 'Chennai (south-india)',             value: 'South India' }
          { title: 'Osaka (japan-west)',                value: 'Japan West' }
          { title: 'Shanghai (china-east)',             value: 'China East' }
          { title: 'Beijing (china-north)',             value: 'China North' }
          { title: 'Seoul (korea-central)',             value: 'Korea Central' }
        ]
      storage              :
        label              : 'Storage'
        type               : 'selection'
        placeholder        : 'storage replication type'
        defaultValue       : 'Standard_LRS'
        values             : [
          { title: 'Locally redundant storage (LRS)',            value: 'Standard_LRS' }
          { title: 'Zone-redundant storage (ZRS)',               value: 'Standard_ZRS' }
          { title: 'Geo-redundant storage (GRS)',                value: 'Standard_GRS' }
          { title: 'Read-access geo-redundant storage (RA-GRS)', value: 'Standard_RAGRS' }
          { title: 'Premium Locally redundant storage (P_LRS)',  value: 'Premium_LRS' }
        ]

  rackspace                :
    name                   : 'Rackspace'
    link                   : 'http://www.rackspace.com'
    title                  : 'Rackspace'
    color                  : '#d8deea'
    supported              : no
    enabled                : no
    description            : 'Rackspace machines'
    credentialFields       :
      username             :
        label              : 'Username'
        placeholder        : 'username for rackspace'
      apiKey               :
        label              : 'API Key'
        placeholder        : 'rackspace api key'

  softlayer                :
    name                   : 'Softlayer'
    link                   : 'http://www.softlayer.com'
    title                  : 'Softlayer'
    color                  : '#B52025'
    supported              : yes
    enabled                : no
    description            : 'Softlayer resources'
    credentialFields       :
      username             :
        label              : 'Username'
        placeholder        : 'username for softlayer'
      api_key              :
        label              : 'API Key'
        placeholder        : 'softlayer api key'

  userInput                :
    name                   : 'User Input'
    title                  : 'User Input'
    listText               : '''
                            Here you can change user input fields that you define
                            in your stack scripts. When you delete these,
                            make sure that you update the stack scripts that
                            these are used in. Otherwise you may experience
                            unwanted results while building your stacks.
                            '''
    credentialFields       : {}
