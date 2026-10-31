class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261031.010042.dfe210e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-010042-dfe210e/marvel-darwin-arm64"
    sha256 "07f92a6f1575334a6821da16632be1309405b862e9df1248c566a0428d7f29cd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-010042-dfe210e/marvel-darwin-amd64"
    sha256 "c2128bcb442fb299fb2d1282d9e9c4c76095405a37f135ede6dc841a8e555a3b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-010042-dfe210e/marvel-linux-arm64"
    sha256 "5e898e769e863804a8671d54cf83472db08ba980af774e24ba33d56792e0ee7c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-010042-dfe210e/marvel-linux-amd64"
    sha256 "e141ad77f11d5d6eee98a9ba06b00d53cb09f2c946ba9de5c06525ebc6d18b7f"
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
