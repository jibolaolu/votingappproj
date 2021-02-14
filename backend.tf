terraform {
  backend "s3" {
    bucket = "seunadio-tfstate"
    key    = "VotingApp/2020sessions.tfstate"
    region = "eu-west-2"
  }
}
