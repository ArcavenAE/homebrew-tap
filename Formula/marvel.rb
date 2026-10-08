class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.200531.0108210"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200531-0108210/marvel-darwin-arm64"
    sha256 "e1e493d2f2099cf2c4b63cf2560d8470962afe19d0fae62b574e4db0f4436607"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200531-0108210/marvel-darwin-amd64"
    sha256 "78bfcbcd14a1f3cbeea81f6c75f89d63386a4bab2f8143e4fcf7294c83f45f82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200531-0108210/marvel-linux-arm64"
    sha256 "af461132791fe3c806afaa87510e349f54bd4031720cd8b7a99ecafb3dadd4e4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200531-0108210/marvel-linux-amd64"
    sha256 "f0d7ef2b022eabf05ab2d4d7bc2ee929d025125168e86f2029adc71a3a8f695e"
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
