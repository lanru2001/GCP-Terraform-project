
variable "project" {
  description = "The name for the project to deploy resources in GCP"
  type        = string 
  default     = ""

}

variable "network_name" {
  description = "The name for the network "
  type        = string 
  default     = ""

}

variable "auto_create_subnetworks" {
  description = "Whether to auto create a subnetwork within the network"
  type        = string 
  default     = ""

}

variable "vm_name" {
  description = "The name used to identify the google compute engine"
  type        = string 
  default     = ""

}

variable "machine_type" {
  description = "The machine type to run google compute engine(vm) on"
  type        = string 
  default     = ""

}

variable "zone" {
  description = "The core zone to deploy the google compute engine"
  type        = string 
  default     = ""

}

variable "image" {
  description = "The operating system image to run google compute engine"
  type        = string 
  default     = ""

}

#variable "labels" {
#  description = "The labels used to identify the google compute engine"
#  type        = map(string)
#  default     = {}
#
#}

variable "size" {
  description = "The disk or volume size of the  google compute engine"
  type        = string 
  default     = ""

}

variable "type" {
  description = "The type attached to the os engine"
  type        = string 
  default     = ""

}

variable "firewall_name" {
  description = "The firewall name attached to the vm"
  type        = string 
  default     = ""

}

variable "target_tags" {
  description = "The  target tag attached to the firewall rule"
  type        = list(string) 
  default     = [""]

}

variable "tags" {
  description = "The netwok firewall tag attached to the vm"
  type        = list(string) 
  default     = [""]

}



variable "network" {
  description = "The network name attached to the vm"
  type        = string 
  default     = ""

}

variable "subnetwork" {
  description = "The subnetwork name attached to the vm"
  type        = string 
  default     = ""

}

variable "subnetwork_project" {
  description = "The subnetwork project name attached to the vm"
  type        = string 
  default     = ""

}

variable "ports" {
  description = "The list of ports allowed in the vm"
  type        = list(string) 
  default     = [""]

}

variable "protocol" {
  description = "The TCP/IP rules allowed"
  type        = string
  default     = ""

}

variable "source_ranges" {
  description = "The ip source ranges to be used by the GCE"
  type        = list(string) 
  default     = [""]

}

variable "user" {
   type    = string
   default = ""  
}

variable "email" {
  type    = string
  default = ""
}
variable "privatekeypath" {
   type = string
   default = "~/.ssh/id_rsa"
}
variable "publickeypath" {
   type = string
   default = "~/.ssh/id_rsa.pub"
}
