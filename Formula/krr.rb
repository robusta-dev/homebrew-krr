class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.25.0/krr-macos-latest-v1.25.0.zip"
        sha256 "f3dcdf5051eccf9c0f10c5ed0c1ac3bb4d9ce9dcb55a977f6b84b990b2abd6b0"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.25.0/krr-ubuntu-latest-v1.25.0.zip"
        sha256 "08311b9797616d79b20f924365f1899fd1250206d78edb76d6114d9125dbf7e2"
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
  
