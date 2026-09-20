class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260920.223643.6e855c2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-223643-6e855c2/marvel-darwin-arm64"
    sha256 "7c7c0646903a983d8bafa9a13ae0108ac5a3c27cb5f609be2ce4eb535a797343"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-223643-6e855c2/marvel-darwin-amd64"
    sha256 "ec5148d8ac47ba47204938fcfc44f21e128ff99d030207eb4dc57f90649704e8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-223643-6e855c2/marvel-linux-arm64"
    sha256 "6f4f0198bf084d0477c05700c35ce3fbd1760ae16287b91001848d5ebb470d98"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-223643-6e855c2/marvel-linux-amd64"
    sha256 "992a0fe11e972b1042fc96cdbeb95096768114eaacde407ad0980ece24d8eb40"
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
