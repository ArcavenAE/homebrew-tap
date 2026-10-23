class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261023.014010.30c852c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-014010-30c852c/marvel-darwin-arm64"
    sha256 "76fa82f76a08b37870ff0b9e9dcc8cc956b779571ed162137d2e78f005b113ee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-014010-30c852c/marvel-darwin-amd64"
    sha256 "bd7edc649aea1ad24a37c97bc9c9d8e9130451a7a6cfde0c4cb8a87c57a30859"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-014010-30c852c/marvel-linux-arm64"
    sha256 "e3ea813491d58159b795b3fab9c9b9d3cce4a25a39f94142575e5c31ce2200c0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-014010-30c852c/marvel-linux-amd64"
    sha256 "c7aa6312193b98339443cd094a316862a3f01ec5e0c31e0562333ceabe3d5e27"
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
