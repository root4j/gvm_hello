# GraalVM Hello
Basic code to create a Hello Program with GraalVM

## Run Locally
Create a Oracle Linux VM in your Oracle tenant and install GraalVM SDK

```bash
curl -s "https://get.sdkman.io" | bash
source "/home/opc/.sdkman/bin/sdkman-init.sh"
sdk install java 20.0.1-graal
```

Create the HelloOCI code

```bash
mkdir $HOME/hello
cd hello
cat <<EOF > $HOME/hello/HelloOCI.java
public class HelloOCI {
  public static void main(String[] args) {
    System.out.println("Hello, OCI People!");
  }
}
EOF
```

Compile de code

```bash
javac HelloOCI.java
```

Create Native Image for the bytecode

```bash
native-image HelloOCI
```
Execute Native Image

```bash
./hellooci
```

## Execute Terraform Template
[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/root4j/gvm_hello/releases/download/1.0/hello.zip)