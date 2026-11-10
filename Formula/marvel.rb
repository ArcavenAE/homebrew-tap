class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.134715.7db97b6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-134715-7db97b6/marvel-darwin-arm64"
    sha256 "bd56e31648b36e7b6c9cb24b8d7552f61d52de62bf7135aa2cc1bbabf682b94d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-134715-7db97b6/marvel-darwin-amd64"
    sha256 "0791fcb3443d1adb2b5f7207e35222b221bd30eacc585d64ccab639f30216f80"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-134715-7db97b6/marvel-linux-arm64"
    sha256 "78bc26667f9e968eaaa5443aaf1488765b120a4a6502af7598bb89e949c97e25"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-134715-7db97b6/marvel-linux-amd64"
    sha256 "8d6046b819b01ada411cf80d96095155b06c226d9b97735db43cd3e4b4bff351"
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
