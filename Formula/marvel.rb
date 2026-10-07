class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.024949.efbd20c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024949-efbd20c/marvel-darwin-arm64"
    sha256 "acc4f1c347e09b9a5e56f176eaae0cdb0bb01437a74f732cbd8bd9e51cfe927d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024949-efbd20c/marvel-darwin-amd64"
    sha256 "0a140cd257ab873999aa788ae7814e0656391af34c06cf942ed82cbe7eb0762a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024949-efbd20c/marvel-linux-arm64"
    sha256 "ea8e689f446f2721f7331bc3a10abb39159c0cf963c3fd855de1c97c02e2aea0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024949-efbd20c/marvel-linux-amd64"
    sha256 "cc146eb573f4f68bb2ddf619dbab92b886661fb66ef2363b3c6ba2ca7e99b0c6"
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
