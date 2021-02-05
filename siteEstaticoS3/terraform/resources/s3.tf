resource "aws_s3_bucket" "log"{
    bucket = "${var.app_name}-${var.domain}-logs"
    acl = "log-delivery-write"
}

resource "aws_s3_bucket" "site"{
    bucket = "${var.app_name}-${var.domain}"
    acl = "public-read"
    policy = data.template_file.policy.rendered

    website {
      index_document = "index.html"
      error_document = "index.html"
    }

    logging {
      target_bucket = aws_s3_bucket.log.bucket
      target_prefix = var.domain
    }
}

resource "aws_s3_bucket" "redirect"{
    bucket = "www.${var.app_name}-${var.domain}"
    acl = "public-read"

    website {
      redirect_all_requests_to = "${var.app_name}-${var.domain}}"
    }
}