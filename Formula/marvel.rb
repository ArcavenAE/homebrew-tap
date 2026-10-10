class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.194157.a5ad412"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-194157-a5ad412/marvel-darwin-arm64"
    sha256 "e2011139197f25d9ce0743b6470c21482d3d6373f1cb5adba2e4b9260e87f691"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-194157-a5ad412/marvel-darwin-amd64"
    sha256 "34fa62f60707c27d1e2a46c28b86d6249373eae634590b44295d8f2351811853"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-194157-a5ad412/marvel-linux-arm64"
    sha256 "38ceae242d5d6180e2e4feffba33b1c958a4b77e4dd9b449e3473269a105d62c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-194157-a5ad412/marvel-linux-amd64"
    sha256 "ad9465ebd40ee4d46cc1d8cd3195b0565a2fb62df1fb64484bcd98eb2fcc137e"
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
