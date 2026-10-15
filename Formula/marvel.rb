class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.194956.dddf634"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-194956-dddf634/marvel-darwin-arm64"
    sha256 "4c95cad44a1e32e985874e0624bdcc9b1c53c51fdbcab34012ddbf7e54fa5818"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-194956-dddf634/marvel-darwin-amd64"
    sha256 "0788311c745689cd79ad2c5d7e6069264a149d63c71733b138d7fc0de36728bb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-194956-dddf634/marvel-linux-arm64"
    sha256 "84a58f80362f1e240677e5307fde572cc870cdc57a7d630a9cbad287b83a58f8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-194956-dddf634/marvel-linux-amd64"
    sha256 "302ee2c26c9e2b7c6c21e32c9124a0370c71c2345e9a535cdbfd065e1d4b7a79"
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
