class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261115.204945.f8ee835"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261115-204945-f8ee835/marvel-darwin-arm64"
    sha256 "d36ec00a8aa3e66a97558518ba18645da8903789baeed19bbf9da598f5928c95"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261115-204945-f8ee835/marvel-darwin-amd64"
    sha256 "598e1866fb3bb3b6d4803c01ba5be9367b1c385c11f74df25e0bb866a6fc4326"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261115-204945-f8ee835/marvel-linux-arm64"
    sha256 "d44ef084f67fe73db2b0fff2e7fef631b7d0aa5b3b9be2817b94dc23130c0c25"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261115-204945-f8ee835/marvel-linux-amd64"
    sha256 "cbf064212b8882e9bee46550468377e6790dba19726cc4e4866a9629a8b45cc4"
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
