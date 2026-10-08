class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.032201.9e47465"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-032201-9e47465/marvel-darwin-arm64"
    sha256 "8d35162f6371fc294176717dc03bad8fa7b1bc82e1915e60a7e7125cc3dd1b0d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-032201-9e47465/marvel-darwin-amd64"
    sha256 "0b350f41c65fe1c698b66a5f8e5ba6c822160ad35a918a43d5759a38935d5511"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-032201-9e47465/marvel-linux-arm64"
    sha256 "1beac8485946cf971e8411c0a24490233482116002d15d9479aef3686af3fa34"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-032201-9e47465/marvel-linux-amd64"
    sha256 "915462365575a59ea48dd0e30458d8c57d9933639186c1c246fab3affa57a1a7"
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
