class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.171936.07a4557"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-171936-07a4557/marvel-darwin-arm64"
    sha256 "9b8683ece95514656e02405512cfe603a629cb5fbe4bb6c2a5895c40f6304109"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-171936-07a4557/marvel-darwin-amd64"
    sha256 "2cd181c68fbf50e72fa49b75c16df4b050f7f53c775886439dd1f2fff04d8899"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-171936-07a4557/marvel-linux-arm64"
    sha256 "29c04604accd315c0ba37f1e7a87489e4c005de608c93ce46ce010280078f70a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-171936-07a4557/marvel-linux-amd64"
    sha256 "a79bd32829e919221d3b254093d195f18565c5d049a6e84d255b71250eaaca4d"
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
