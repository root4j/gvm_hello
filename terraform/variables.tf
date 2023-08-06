# +--------------------------+
# | Declaration of Variables |
# +--------------------------+
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "region" {}
variable "network_cidr" {}
variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOq6w/Y8WhksQInjmJr7NV/pyMrlBWsFpGoauFRUi3GIKPsRuPDNwWA//40dBYf7jVQjpgBN6bjOaWz/z0rsgG2pWYZZiSUs7ok9BkEWA/i5xm/zFhvhj1IF336Qfa2JM8Tgu1YWCJuLRbLtEVqRowkKnbIcPNX9BMuG2OuzjDdT97XQ01zvUf32V1U/N1pS+qWpuL5FKK2R92gnK1ubK1zGomr/UBB2gZHkHOaGv7OC2Xb+NjyPLZ+jc+gK8LPkIP7GO2WyB12XDeGZ8/ttiTNR9FRw+wo4d5HokfMGclc5vj+Iab+unnxIjvmLMruIsf54shO6EmlqKgAgq0s2pb ssh-key-2023"
}
variable "ssh_private_key" {
    default = "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAzqusP2PFoZLECJ45ia+zVf6cjK5QVrBaRqGrhUVItxiCj7Eb\njwzcFgP/+NHQWH+41UI6YATem4zmls/89K7IBtqVmGWYklLO6JPQZBFgP4ucZv8x\nYb4Y9SBd9+kH2tiTPE4LtWFgibi0Wy7RFakaMJCp2yHDzV/QTLhtjrs4w3U/e10N\nNc71H99ldVPzdaUvqlqbi+RSitkfdoJytbmytcxqJq/1AQdoGR5Bzmhr+zgtl2/j\nY8jy2fo3PoCvCz5CD+xjtlsgddlw3hmfP7bYkzUfRUcPsKOHeR6JHzBnJXOb4/iG\nm/rp58SI75izK7iLH+eLITuhJpaioAIKtLNqWwIDAQABAoIBAAFSJGnYBQgjvA9B\nGPx1fViypbp+X5Sj13fdXF8KGy3gn0qB1N1c7zv0hdp844T4manm9giICDDVIHf3\nb8Bpry5dxM1j5K/OHnTaBa0GWomHspqqLg/VeXOuVSd9oOPRVr4hB6RpBbxRCJkn\nRXS7QgOVWiqsb3yGGLlxVM14YWcbca22Nu652349OB6pABTiRKl8bfi/aT1IlNbT\nZxL9AdpzjXiJ1O4GebJsiNAaWyjd1PkaiT2mnUMgZP8ABptuq8YW2jdOdANfcnYd\nviUCmMmqpIajj68JArw8zpLxOWvwRwelnYsPLWyjEKjakiVvV9Y8J0gjay0HFpnK\n8ZPnjekCgYEA9vCCyITfeCee9bk6y7xZZwh5mLnrmQ4Mmk4qWi8ODWNkrf533Ytx\n6V4l00hEH+UOTmmGJImcgKqs3pp1ASki1OcToBiuHeQkBVNgKlpbe+jyA5VLaROM\nMF/reSlyAqREUIYMLVXPl5OcGBl2YH0qZ4f5XvEwew8z2p6WuH2PqTMCgYEA1kDr\nHVRAEi2hItP4e2TyQGzD4m248Eb0+rqh/ricbakAxljzt01m2IDhuxSPVhTI74Hj\nQv2GwLOhtQLtZn+KyLZ72bNCB8FZA2xLS6XXlzNvWPfe7IqG+cIhtm+tZDQJVW8p\nNPUfHpJ5+Uoy9p0/K6EpZrNMBl2XZbTQsg/6SjkCgYA+l9BOy39pkYF1f7Irml5/\nA2LvF5Fkhm8jXdTWbz78nckTYYE4ovQI11h3KcY633C054KdGFSXOKwA8N3foXG2\nzavn1Nmtsfp/bxbdJXIzAmT2C43F4LKUQHwLhjnj+YdncdL8Wtf37+6NHUcoRhHN\nlGXdbv1+8+eM7s39jbYwiQKBgQCfKTi/3+980ZLLmaYUnIft3h6iXZouPLgOboia\n/i+OsyaVMk1SlVhaa1vFK1/TtbsTWW0nPclV69ur6VHMe+Dwe8eDkMvzkOl8Rn2k\n471FYHtOH0zmcX4VmeaLbWjkcFeitOJqqdGFV5Du5PT5CRV9ZsqntXg7nlkyv+Ds\n9jub2QKBgB7BFosf1Q9XBVNrRge48D0S5GLYNdABX2m62PTZb6joI7f8/j7ar0S1\n/EuRX1hfOZ+6q7sDXuzgmOWiFEKTE7jdz2B8Ss/atTVKaSuCaTJ2A36Kp8eNjuMs\nROGzWTKCZLPMrzwF44rTzYKR9eMvuZqITK65GmXeULTr5et075Lq\n-----END RSA PRIVATE KEY-----"
}