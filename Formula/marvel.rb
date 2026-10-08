class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.040421.e056128"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-040421-e056128/marvel-darwin-arm64"
    sha256 "6fc2d853b2c541076f28b8b4facae145f10cf0dc7a9754bece053e24250ab3b8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-040421-e056128/marvel-darwin-amd64"
    sha256 "9f2a34ce611c12cd2034c6432d3d6f7ee31330107cceef04b35f5531db100f28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-040421-e056128/marvel-linux-arm64"
    sha256 "0e51c641dd9ffe7b54b718fec87f50634ab9f969581ad35aebcdf075d349f344"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-040421-e056128/marvel-linux-amd64"
    sha256 "4070d2c9993c60691a4875c00dd3762ff105db2c58ac6121747c6263b67c6962"
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
