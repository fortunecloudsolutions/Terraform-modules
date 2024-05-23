# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Below are the order and Dependencies in which Load Balancer needs to be created.

* Target Group									 			  			- target-group-alb/nlb
* Register Instances/Lambda/IP to Target Group  			  			- target-group-alb/nlb-attach
* Create Load Balancer ALB/NLB                  			  			- app/net-load-balancer
* Add Listeners for Load Balancers & Set Default action      			- alb/nlb-listener
* Add rules/actions in addition to default action for ALB listeners  	- alb-listener-rules
* Add SSL certificates on Default SSL Listener certificate             - additional-listner-cert  

# AWS Application and Network Load Balancer (ALB & NLB) Terraform module

Terraform module which creates Application and Network Load Balancer resources on AWS.

These types of resources are supported:

* [Load Balancer](https://www.terraform.io/docs/providers/aws/r/lb.html)
* [Load Balancer Listener](https://www.terraform.io/docs/providers/aws/r/lb_listener.html)
* [Load Balancer Listener Certificate](https://www.terraform.io/docs/providers/aws/r/lb_listener_certificate.html)
* [Load Balancer Listener default actions](https://www.terraform.io/docs/providers/aws/r/lb_listener.html) - All actions supported.
* [Load Balancer Listener Rule](https://www.terraform.io/docs/providers/aws/r/lb_listener_rule.html)
* [Target Group](https://www.terraform.io/docs/providers/aws/r/lb_target_group.html)
* [Target Group Attachment](https://www.terraform.io/docs/providers/aws/r/lb_target_group_attachment.html)
