module lambda-teste {
    source = "./infra-terraform-modules/lambda"
    lambda_repo = "git@github.com:lugui-co/lambda-teste2.git"
    description = "Lambda de teste --apagar"
    function_name = "lambda-teste2"
    runtime = "docker"
    handler = "main.lambda_handler"
    iam_prefix = "lambda_exec_"
    memory_size = 128
    timeout = 30
    no_build = true
    no_clone = true
    venvs = {
        WORKSPACE = terraform.workspace,
    }
}