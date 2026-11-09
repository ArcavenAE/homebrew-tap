class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.062926.6f4fe40"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-062926-6f4fe40/marvel-darwin-arm64"
    sha256 "ff034f1641039a742e5b98e902dc795c98bd7e22ad2e5419b0379014afa76853"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-062926-6f4fe40/marvel-darwin-amd64"
    sha256 "2e9ea2a8d9690f11abd9a33137efeb5f0b68a27e08b0987d0b54046c6e55abdb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-062926-6f4fe40/marvel-linux-arm64"
    sha256 "867b00e8800c55d6a982835a2b33461db0a0995a99bd85436fc255767720362e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-062926-6f4fe40/marvel-linux-amd64"
    sha256 "a5827867fec7f9eed1b8e5467fe6e47efd42509bdeb0f8b50835b6ff58f98eeb"
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
