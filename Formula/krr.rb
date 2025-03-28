class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.23.0/krr-macos-latest-v1.23.0.zip"
        sha256 "920ab799e6b34ecfec8bff2b9670d1848bd6c21c9a9dbf369d013f636d3d8ea8"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.23.0/krr-ubuntu-latest-v1.23.0.zip"
        sha256 "2b1ec681164a9183a87803b90f568425c4242b0ca66bfe1f867baa9364387371"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
        # our binaries are built with pyinstaller and the first executable run is very slow because it unzips packages
        # to work around that, we "warm up" the binary here during installation so it is fast when the user runs it for the first timeo
        ohai "Running 'krr version' to warm up binary and extract compressed python libraries... this can take up to 60 seconds"
        system libexec/"krr", "version"
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
