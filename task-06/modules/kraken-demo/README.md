# kraken-demo terraform module


## Usage
```terraform
module "kraken-demo" {
  source  = "./modules/kraken-demo"
  
  name = "<name>"
  suffix = "<bool>" 
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

- name defines the resource names
- suffix post appends a type to the resource name
- tags are a list of tuples to be applied to the resources