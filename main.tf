module "site" {
  source  = "./site_s3"
  domain              = local.config.domain
}

module "certificate" { 
  source = "./certificate" 
  domain           = local.config.domain 
  vca = module.certificate.output.vca
   
} 

module "cloudfront" { 
  source = "./cloudfront" 
  domain           = local.config.domain 
  zoneid           = local.config.zoneid
  vca = module.certificate.output.vca
} 
