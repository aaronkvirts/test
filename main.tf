terraform {
  cloud {
    organization = "virtuosity"

    workspaces {
      name = "import-ecs2"
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

resource "alicloud_security_group" "sg" {
  name = "Aaron-test-sg"
  vpc_id = "vpc-8psy6tb0mmlppwxui7e0x"
}

resource "alicloud_instance" "Test" {
  security_groups = alicloud_security_group.sg.*.id
  instance_type = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_efficiency"
  system_disk_name = "Aaron-test-disk"
  image_id = "aliyun_3_x64_20G_alibase_20230424.vhd"
  instance_name = "Aaron-test"
  vswitch_id = "vsw-8psle91nr385rpxgyqi8p"
  system_disk_size = 20
}
