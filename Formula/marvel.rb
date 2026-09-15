class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.162125.f48ce15"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162125-f48ce15/marvel-darwin-arm64"
    sha256 "150bd6f268037031b0ead23b04196b0cf00d85da680813e0ca0831bd269cd9a9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162125-f48ce15/marvel-darwin-amd64"
    sha256 "8d1f9f71fbdf4468c8befc44ddbe13308948f9d0df62ab6e6db8f643dbe75166"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162125-f48ce15/marvel-linux-arm64"
    sha256 "ea635acbc6840bbb3b4ca061f626b2451317ba8dbb606326cedeaa6dfe3642b6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162125-f48ce15/marvel-linux-amd64"
    sha256 "48ad4e863d9c49b9df0e3c44bfc12bfd2b7f8e85bed34fa3dd02464f437f9005"
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
