class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.212953.9e17609"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-212953-9e17609/marvel-darwin-arm64"
    sha256 "843c6c1f93e673ff5c99a252bb2aa7d95cc1a6303328d06890c58ffbd0ceb374"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-212953-9e17609/marvel-darwin-amd64"
    sha256 "3fcfe7441b6ea3bce355359b08bccb3ca1d5dfdbf3f8002e5d76044b19806d0b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-212953-9e17609/marvel-linux-arm64"
    sha256 "12961eca525254a12a4ed837569275baba51acd1a51f0b17bffc365e7e7dd63c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-212953-9e17609/marvel-linux-amd64"
    sha256 "4f41c75397473440d3758b47f200b29302da25c533a1140119e2096538237cd8"
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
