class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.174744.1ab13d3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-174744-1ab13d3/marvel-darwin-arm64"
    sha256 "7b3a96b4879a962abcf46afa409489abece289e3fabcc145d732743e01847c28"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-174744-1ab13d3/marvel-darwin-amd64"
    sha256 "6e5801f8fc46d569b67a66c4ff4f1bc7b57d59af773440fb5cd78466cbaaa0e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-174744-1ab13d3/marvel-linux-arm64"
    sha256 "b89bac317594e65c4027a9a25930d0b639e8b4635dad2693ff9a06ed6fd499a2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-174744-1ab13d3/marvel-linux-amd64"
    sha256 "84852983c57c61b7787ac2890edd29f54fe6cfaaec64685fd9215a22178d190a"
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
