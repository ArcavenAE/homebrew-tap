class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.155320.29e5ae6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-155320-29e5ae6/marvel-darwin-arm64"
    sha256 "a0b19886d5bedb594707e3d9eb4a4f066075b4610990214fefe7ed5bd6a61856"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-155320-29e5ae6/marvel-darwin-amd64"
    sha256 "e11da22619d92a918966382d0ecc0f68bb761494fdf3ab1911043676dfe4875b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-155320-29e5ae6/marvel-linux-arm64"
    sha256 "545a4c8c5a3de92ea421fcc697177c9e6f64791afd72e0fe6c4f9538872f9889"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-155320-29e5ae6/marvel-linux-amd64"
    sha256 "cc66006e5085aa3707d836f9de417f366e5984c1efd5cc4b6cfdb25f39fca39c"
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
