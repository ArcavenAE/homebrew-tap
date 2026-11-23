class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.223110.b24ea2d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-223110-b24ea2d/marvel-darwin-arm64"
    sha256 "2829943c8362bdcb17fc7ee60dd56634a3e3e79680cb3e856674515788575b2d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-223110-b24ea2d/marvel-darwin-amd64"
    sha256 "1a72b15d77a24e317d666323e0cc732b2b63e58c4a6aa97fb06c621b0b4c9690"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-223110-b24ea2d/marvel-linux-arm64"
    sha256 "6994c9b324bc7aa42a15f38f70aadf8ba1fcc7ad41f5e5c4403ef0bb6856dd9c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-223110-b24ea2d/marvel-linux-amd64"
    sha256 "5ad6b098d05e02ceb9121732f9561f5d4eb7bce15aadde7aa8aee641a6e22bed"
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
