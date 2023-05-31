variable ALICLOUD_ACCESS_KEY {}
variable ALICLOUD_SECRET_KEY {}

terraform {
  cloud {
    organization = "virtuosity"

    workspaces {
      name = "test"
    }
  }

  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.205.0"

    }
  }
}

provider "alicloud" {
  access_key = var.ALICLOUD_ACCESS_KEY
  secret_key = var.ALICLOUD_SECRET_KEY
  region     = "ap-southeast-3"
}

resource "alicloud_instance" "Test" {
  security_groups = [ "sg-8ps2di45ns5shx56ro6a" ]
  instance_type = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name = "Aaron-test-disk"
  image_id = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name = "Aaron-test"
  vswitch_id = "vsw-8psle91nr385rpxgyqi8p"
  system_disk_size = 40
}
