class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.042013.e84283e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-042013-e84283e/marvel-darwin-arm64"
    sha256 "dd912b14fc317b8294fa22639a9d91393f3e4e833f89e51bc88e70cf1102b556"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-042013-e84283e/marvel-darwin-amd64"
    sha256 "de139ea81df3d2b1ed3f33863abbf50a338826234fb8ffbf69a6bf8d6289c218"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-042013-e84283e/marvel-linux-arm64"
    sha256 "cae99de32607c77467c25572b6f8160d78f066124047733569da6182e1afa0a4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-042013-e84283e/marvel-linux-amd64"
    sha256 "001757aff36593af9a1fb8827101b93ee19f1de458b2a88946522742514462d1"
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
