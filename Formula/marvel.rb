class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.132105.632121c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-132105-632121c/marvel-darwin-arm64"
    sha256 "5a30b728b18ec9f9ca7c7181865fdfd7d8a199c5005a24595f311f509b53980d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-132105-632121c/marvel-darwin-amd64"
    sha256 "b7c5c3ff962adf31bababbf30bc496fec0c03284aa86c467d238bf61883fbfd4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-132105-632121c/marvel-linux-arm64"
    sha256 "6b8e70d0a336dc6279e8c649a2735ba7282b64454f207ed59bd5e509b044dc6c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-132105-632121c/marvel-linux-amd64"
    sha256 "0b6b84b5798f415a916d31d02871101382a790338b67dfc52e8a7cb7658fff9a"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
