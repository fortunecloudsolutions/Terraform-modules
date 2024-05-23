resource "aws_glue_classifier" "classifier" {
  name = var.name
  dynamic "csv_classifier" {
    for_each = var.csv_classifier != null ? [var.csv_classifier] : []
    content {
      allow_single_column    = lookup(csv_classifier.value, "allow_single_column", null)
      contains_header        = lookup(csv_classifier.value, "contains_header", null)
      delimiter              = lookup(csv_classifier.value, "delimiter", null)
      disable_value_trimming = lookup(csv_classifier.value, "disable_value_trimming", null)
      header                 = lookup(csv_classifier.value, "header", null)
      quote_symbol           = lookup(csv_classifier.value, "quote_symbol", null)

    }
  }

  dynamic "grok_classifier" {
    for_each = var.grok_classifier != null ? [var.grok_classifier] : []
    content {
      classification  = lookup(grok_classifier.value, "classification", null)
      custom_patterns = lookup(grok_classifier.value, "custom_patterns")
      grok_pattern    = lookup(grok_classifier.value, "grok_pattern", null)

    }
  }

  dynamic "json_classifier" {
    for_each = var.json_classifier != null ? [var.json_classifier] : []
    content {
      json_path = lookup(json_classifier.value, "json_path")
    }
  }

  dynamic "xml_classifier" {
    for_each = var.xml_classifier != null ? [var.xml_classifier] : []
    content {
      classification = lookup(xml_classifier.value, "classification")
      row_tag        = lookup(xml_classifier.value, "row_tag")
    }
  }
}