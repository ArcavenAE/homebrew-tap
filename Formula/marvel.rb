class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.073405.968e0d6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073405-968e0d6/marvel-darwin-arm64"
    sha256 "4b41ffa608fc9c9c55d54a1a00ae7898c008c3411d5bbf638c4a52d4577c7e50"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073405-968e0d6/marvel-darwin-amd64"
    sha256 "3847e3a6c2e731eff946c46711023c5ac4bac07d2062dddb0557bee994a2c25e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073405-968e0d6/marvel-linux-arm64"
    sha256 "f535ee0a65a259015c680de84c44f52885844689ff3c9c8d9da80969ec879753"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073405-968e0d6/marvel-linux-amd64"
    sha256 "07e61341b997c6cdc1b6d4b8aeccec6a8e05362df105d9b57259c27802a17781"
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
