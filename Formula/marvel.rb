class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.162941.e4ec956"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-162941-e4ec956/marvel-darwin-arm64"
    sha256 "ea7bcfe82882591aec6b982384dd9628cf18eb617ae10a3200804356b158f28d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-162941-e4ec956/marvel-darwin-amd64"
    sha256 "d55db05e0c25b1c57775eb34329330f86dc19a67a6076d4672316ddf70c989fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-162941-e4ec956/marvel-linux-arm64"
    sha256 "76b1cde2f28acae4ae17b5f52f9bc621335b11f94e0216dfbd19c9891466f693"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-162941-e4ec956/marvel-linux-amd64"
    sha256 "03bdd659b323f1a27b96320d87d4c22f4cb5c107f700cbef9ef5201d24bfd1d3"
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
