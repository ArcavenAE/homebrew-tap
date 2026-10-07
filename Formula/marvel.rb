class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.043508.f87fa87"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043508-f87fa87/marvel-darwin-arm64"
    sha256 "ae3bfca0d494adcd0f6b1601c7427ec80ceb056fb632529fc78d246b5f3b36ae"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043508-f87fa87/marvel-darwin-amd64"
    sha256 "e40410c52b271b6dfb5e1668ec7b377902c913031149ccf5e0245b6cb2016f6c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043508-f87fa87/marvel-linux-arm64"
    sha256 "3949cb003d6b67aab8e6b15ad5f0edfc4a8f0103b229d895eec978baf84dbfd1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043508-f87fa87/marvel-linux-amd64"
    sha256 "cff5daede47c7548acef9e4ae271c65a2469966ec6ca522cb226fc30f55a2424"
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
