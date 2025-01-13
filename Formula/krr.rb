class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.19.0/krr-macos-latest-v1.19.0.zip"
        sha256 "e9059ea98e33b0b8e4d45222bb8cbfa5fad5647d663acb48140d94a6f08c2943"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.19.0/krr-ubuntu-latest-v1.19.0.zip"
        sha256 "e37b3599d4c47edd372098fc67cd6625fe951690cd6dc34dd5c6f16379515bdd"
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
  
