class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.21.0/krr-macos-latest-v1.21.0.zip"
        sha256 "48e3b1412c449260d10bb8d8a5ba91289b298d164b1235a5c4d621822eb07c97"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.21.0/krr-ubuntu-latest-v1.21.0.zip"
        sha256 "244585c5a2e2b614da4b9e1e5487a7d393c780a1973133917156a8d7e50005eb"
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
  
