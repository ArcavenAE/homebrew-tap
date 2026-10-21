class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.192939.b74c1cf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-192939-b74c1cf/marvel-darwin-arm64"
    sha256 "955c70f3b0d3566fadc742c0d360a7b84d223473cceabd313a0cfe63547986a0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-192939-b74c1cf/marvel-darwin-amd64"
    sha256 "10340f0ebaaf5a1519e0369409c21d27def21ff4a135a5f5f56fdb7eee3ca406"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-192939-b74c1cf/marvel-linux-arm64"
    sha256 "e9907ae7776138675e497227f80e3f767c962c08ec43f98fd0495b96d0668898"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-192939-b74c1cf/marvel-linux-amd64"
    sha256 "a616e7cc0b78a027581ded39b7dce2378b5dc38b48cb23ecc75454ba23d175b3"
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
