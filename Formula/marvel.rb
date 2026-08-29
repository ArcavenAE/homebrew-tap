class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260829.002821.ee47a47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002821-ee47a47/marvel-darwin-arm64"
    sha256 "e735eb70bc3a694a8fe60e30aeb856789e4b4d94a843fcb4828b83ca7730a0b3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002821-ee47a47/marvel-darwin-amd64"
    sha256 "3872cad4df8967c574205236f8da44610faf96dcf2bfbd1dcec5db82c70cef30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002821-ee47a47/marvel-linux-arm64"
    sha256 "1f801992a94310c2207aa222f1fe2e4505a6eae8e9cf17d56a53013498d93b5d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002821-ee47a47/marvel-linux-amd64"
    sha256 "f387198d656a7313b63cae0874dd9d4cd2fc0b73011a0cffacfa464d4bf43bd2"
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
