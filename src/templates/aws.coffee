# AWS PROVIDER DEFAULT STACK TEMPLATE

module.exports = (instanceName, instanceType) ->
  # JSON FORMAT
  json: """
{
  "provider": {
    "aws": {
      "access_key": "${var.aws_access_key}",
      "secret_key": "${var.aws_secret_key}"
    }
  },
  "resource": {
    "aws_instance": {
      "#{instanceName}": {
        "tags": {
          "Name": "${var.koding_user_username}-${var.koding_group_slug}"
        },
        "instance_type": "#{instanceType}",
        "ami": "",
        "user_data": "\\necho \\\"hello world!\\\" >> /helloworld.txt\\n"
      }
    }
  }
}
    """

  # YAML FORMAT WITH COMMENTS
  yaml: """
provider:
  aws:
    access_key: '${var.aws_access_key}'
    secret_key: '${var.aws_secret_key}'
resource:
  aws_instance:
    #{instanceName}:
      instance_type: #{instanceType}
      # select your ami (optional) eg. ami-xxxxx (it should be based on ubuntu 14.04)
      ami: ''
      # on user_data section we will write bash and configure our VM
      user_data: |-
        # please note: all commands under user_data will be run as root.
        apt-get install git
        git clone git://some/git/repo
        cd $_
        make
    """

