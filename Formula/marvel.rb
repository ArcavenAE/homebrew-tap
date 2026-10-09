class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.020712.7ca4927"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-020712-7ca4927/marvel-darwin-arm64"
    sha256 "5e2133d39a288b7fbc2ac621151f6c30e18506586f71d919e32ad32ef0212b0d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-020712-7ca4927/marvel-darwin-amd64"
    sha256 "b97e460bf95667bdd76c367a27c0808ac852f4b88a25a961fd09674bf6e4c144"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-020712-7ca4927/marvel-linux-arm64"
    sha256 "d23f6a98ebc7932b1e356120068a78c243cad9705645420f96554815849344ae"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-020712-7ca4927/marvel-linux-amd64"
    sha256 "ced59f632987734df7bf5cc2658880b757853645e51e5c5e127cb7d479588808"
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
