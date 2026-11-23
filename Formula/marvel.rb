class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.071809.3cab0ef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-071809-3cab0ef/marvel-darwin-arm64"
    sha256 "959afbe148465bec2cd581fc3e9bf26a7870da2811cf92f8cd752df4f6dcbb53"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-071809-3cab0ef/marvel-darwin-amd64"
    sha256 "0e7b27763928779f0249a5e7dab129d27f76cb09b8f8cf4c6718a4787f8184a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-071809-3cab0ef/marvel-linux-arm64"
    sha256 "fd2494558fc0e36623e5a7c45533d61433a4df8c74d1d97c5da5eed0be3e52bb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-071809-3cab0ef/marvel-linux-amd64"
    sha256 "9460f056e0d7beb9643065c330e1163e5f78badc114abcfabc8de0fbe36e8d91"
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
