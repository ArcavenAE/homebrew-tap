class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.235435.fd46b51"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-235435-fd46b51/marvel-darwin-arm64"
    sha256 "1dab811b391d0116d1c81cdd3de975b7064e88cdb3ef296552ec1ebcf431765f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-235435-fd46b51/marvel-darwin-amd64"
    sha256 "b53553ae041ba3a9d94ca2d41b055ff70dc787178f947986d5b934264a9a1ed5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-235435-fd46b51/marvel-linux-arm64"
    sha256 "f39f5ad9c19f8e288eab5f0368fb10c53161779c3a483e575203ca2af6e55b69"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-235435-fd46b51/marvel-linux-amd64"
    sha256 "867a38f20ce36244d01d0dcdd6fcb08b26ece87e52650924c9678a67ad85048a"
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
