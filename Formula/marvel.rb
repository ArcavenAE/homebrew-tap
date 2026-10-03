class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.034839.c360a2e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-034839-c360a2e/marvel-darwin-arm64"
    sha256 "1b083da0b9babea110de311a0d43e03782294099536585f96b93db90a89fc162"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-034839-c360a2e/marvel-darwin-amd64"
    sha256 "d8249d0bf29f4f9bd0c4d767826dac566fd169901fa2384cfdc9c81e689dfc46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-034839-c360a2e/marvel-linux-arm64"
    sha256 "3a3728648aa522a4b3067bb96419791224168cf7a2ed73e0c4eda3ad28b2d9a5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-034839-c360a2e/marvel-linux-amd64"
    sha256 "8dcfb1ace07fe268923766881dc063648bcf8369de2074e13621f0dc233f2234"
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
