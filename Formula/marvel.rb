class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.063622.71aa0d7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-063622-71aa0d7/marvel-darwin-arm64"
    sha256 "3f87485f41a47ce152ad5b86db8df620fe86e86dc87be9a22428c2a63fa59706"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-063622-71aa0d7/marvel-darwin-amd64"
    sha256 "ba11ff35a8015d705422537928286f22659b2b52270b445bf6515400262c1fda"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-063622-71aa0d7/marvel-linux-arm64"
    sha256 "4611266b431a6490aa95cf062ae5deb66ecd2e8e879030e51d14c42f5f0f37dc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-063622-71aa0d7/marvel-linux-amd64"
    sha256 "88b2eb68f825163629b296255a9e0f0065d94af3d30aa1bd4d9de6588f42ec00"
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
