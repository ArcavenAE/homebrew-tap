class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.223454.a2c6c06"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223454-a2c6c06/marvel-darwin-arm64"
    sha256 "7bb8da252c616e75190e7bc1534ef449f61600b43dffd6488b3f854050e9f49a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223454-a2c6c06/marvel-darwin-amd64"
    sha256 "7b9d99fdf20f167a377dfec82813a37495978fffd299f1d04a34a3d7e8b6d890"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223454-a2c6c06/marvel-linux-arm64"
    sha256 "044073a290983d6639023d7b40d136f7ad035b65b3991f2145fb002aca35e68f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-223454-a2c6c06/marvel-linux-amd64"
    sha256 "6bf3934a99932f49fe77ab27cc9cdd6dd28e4e187179207e097ab78e2fca2bfc"
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
