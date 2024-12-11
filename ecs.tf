module "ecs-test"  {
    source = "./infra-terraform-modules/ecs"

    cluster_name = "ecs-test"
    vpc_id = var.vpc_id
    services = [
        {
            name = "ecs-test-${terraform.workspace}"
            memory = 2048
            cpu = 1024
            ports = [5000]
            subnet_ids = var.app_subnets
            environment_variables = [
                {
                    "name": "WORKSPACE",
                    "value": terraform.workspace
                }
            ]
            security_options = {
                linux_parameters = null
                read_only = false
            }
            discovery_service = true
            load_balancers = {
                subnet_ids = var.app_subnets
                internal = true
                target_port = 5000
                health_check = {
                    enabled = true
                    port = 5000
                    matcher = "200-399"
                    path = "/"
                    timeout = 30
                    interval = 60
                }
            }
        },
    ]
}